import React, { useState }  from 'react';
import {  Link } from 'react-router-dom';

import Fig from '../../../assets/barber.svg'



export default function CadUser(props) {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confPass, setConfPass] = useState('');
    const [notify, setNotify] = useState('');

    function limpNotify () {
        props.click()
        setNotify('')
    }

    return (
        <div className="user signupBx">
        <div className="formBx">
            <form onSubmit={() => {}}>
                <h2>Cadastro</h2>
                <input 
                    type="text" 
                    placeholder="Nome" 
                    id="cadastro-nome"
                    name="fullname"
                    value={name}
                    onChange={e => setName(e.target.value)}
                />
                <input 
                    type="email" 
                    placeholder="email" 
                    id="cadastro-email"
                    name="email"
                    value={email}
                    onChange={e => setEmail(e.target.value)}                    
                />
                <input 
                    type="password" 
                    placeholder="Digite a senha" 
                    id="cadastro-senha"
                    name="password"
                    value={password}
                    onChange={e => setPassword(e.target.value)}                                       
                />
                    <input 
                    type="password" 
                    placeholder="confirme a senha" 
                    id="cadastro-Confsenha"
                    name="passwordConfirm"
                    value={confPass}
                    onChange={e => setConfPass(e.target.value)}                    
                />
                <input type="submit" placeholder="Login" value="Cadastrar"/>
                <p className="signup">Já tem conta? <Link to="#" onClick = {() => limpNotify()} >faça Login</Link></p>
                <h3>{ notify }</h3>
            </form>
        </div>
        <div className="imgBx1">
            <div className="boxImg">
                <img src={Fig} alt="" />
            </div>

        </div>
    </div>
    )


}