import React, { useState }  from 'react';
import { useNavigate, Link } from 'react-router-dom';

import Fig from '../../../assets/barber.svg'



export default function Login(props) {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [notify, setNotify] = useState('');

    const navigate = useNavigate();


    



    async function handleSubmit (e) {
        e.preventDefault();
        setNotify('');
                navigate("/home");
    }

    return (
        <div className="user signinBx">
        <div className="imgBx">
            <div className="boxImg">
                <img src={Fig} alt="" />
            </div>
        </div>
        <div className="formBx">
            <form onSubmit={handleSubmit}>
                <h2>Login</h2>
                <input 
                    type="text" 
                    placeholder="email"
                    id="login-email"
                    name="email"
                    value={email}
                    onChange={e => setEmail(e.target.value)}
                />
                <input 
                    type="password" 
                    placeholder="Password" 
                    id="login-password"
                    name="password"
                    value={password}
                    onChange={e => setPassword(e.target.value)}                    

                    />
                <input type="submit" placeholder="Login" value="Login" href="/home"></input>
                <p className="signup">Não tem uma conta? <Link to="#" onClick = {props.click}>Cadastre-se</Link></p>
                <h3>{ notify }</h3>
            </form>
        </div>
    </div>
    )


}