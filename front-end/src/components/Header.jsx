import React from 'react';

import './styles.css';



export default function Header(props) {


    return (
        <div className="header">
 
            <h2>{props.title}</h2>

        </div>
    )
}