import React from 'react';
import { Link } from 'react-router-dom';
import './style.css';

export default function Home() {




    return (
        <div className="container">
            <header>
                <nav className='navigation'>
                    <ul>
                        <li>Home</li>
                        <li>Outros dados</li>
                        <li>quem somos</li>
                        <li><Link to="/login">Login</Link></li>
                    </ul>
                </nav>
            </header>
            <main>
            <h1>Pagina inicial</h1>
            <p>Site de entrada do aplicativo</p>
            </main>
        </div>
    )
}