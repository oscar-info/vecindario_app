import React from 'react'
import '../assets/styles/components/Footer.scss'
import logo from "../assets/images/vecindario-logo.svg";


const Footer = () => {
    return (
        <footer className="container__footer">
            <div className="container__logo">
                <img src={logo} alt=""></img>
                <p>Tener casa propia sí es posible.</p>
            </div>
            <hr/>
            <div className="container__copyright">
                <p>Copyright © 2019 Vecindario una marca de
                    Grupo Creativo Habla S.A.S </p>
            </div>
        </footer>
    );
}

export default Footer;