import React from "react";
import { Route, Routes } from 'react-router-dom';

import Home from './pages/Home';
import Login from './pages/Login';
import Main from './pages/Professional/PageMain';

export default function Routers() {

    return (
        <Routes>
            <Route exact path="/" element={<Home />}/>
            <Route exact path="/login" element={<Login />}/>
            <Route exact path="/home" element={<Main />}/>
        </Routes>
    )
}