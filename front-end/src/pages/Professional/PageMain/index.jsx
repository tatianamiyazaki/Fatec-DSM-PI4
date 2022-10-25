import React from 'react';

import SideBar from '../../../components/Sidebar';
import Header from '../../../components/Header';

import './styles.css';


export default function PageMain() {

    

    return (
            <div className="mainContainer">
            <Header title="DashBoard" />
            <SideBar />
            <div className="mainPrincipal">
                    <h1>Listagem de dados</h1>
            </div>
        </div>
    )
}