import React from 'react';
import { Link } from 'react-router-dom';

import { IoIosLogOut, IoIosAperture, IoIosClipboard, IoIosSnow, IoIosCash, IoIosJet } from 'react-icons/io'

import './styles.css';



export default function SideBar() {

    function menuToggle() {
        let sidebar = document.querySelector('.sidebar')
        let toggle = document.querySelector('.toggle')
        let header = document.querySelector('.header')
        let mainPrinc = document.querySelector('.mainPrincipal')

          sidebar.classList.toggle('active')
          toggle.classList.toggle('active')
          header.classList.toggle('active')
          mainPrinc.classList.toggle('active')

    }


    return (
        <div className="sidebar">
            <nav>
                <ul>
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosJet/></span>
                        <span className="title">Teste</span>
                    </Link>
                    </li>
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosClipboard/></span>
                        <span className="title">Dashboard</span>
                    </Link>
                    </li>
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosAperture/></span>
                        <span className="title">Settings</span>
                    </Link>
                    </li> 
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosCash/></span>
                        <span className="title">Financeiro</span>
                    </Link>
                    </li>
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosSnow/></span>
                        <span className="title">message</span>
                    </Link>
                    </li>
                    <li>
                    <Link to="#">
                        <span className="icon"><IoIosLogOut/></span>
                        <span className="title">Sign out</span>
                    </Link>
                    </li>                                                                               
                </ul>
                <div className="toggle" onClick={menuToggle}></div>
            </nav>
        </div>
    )
}