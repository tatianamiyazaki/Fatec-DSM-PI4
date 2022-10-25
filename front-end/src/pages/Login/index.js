import React from 'react';


import './styles.css';

import CompLog from './Components/login'
import CompCad from './Components/cadastro'


export default function Login() {

    function toggleForm () {
        const formLog = document.querySelector('.container');
        const formSection = document.querySelector('section');
        formLog.classList.toggle('active');
        formSection.classList.toggle('active');
    }
    

    return (
        <section>
        <div className="container">
        <CompLog 
            click={() => {toggleForm()}}
        />
        <CompCad 
            click={() => {toggleForm()}}
        />

</div>
    </section>
    )
}