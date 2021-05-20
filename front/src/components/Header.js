import React from "react";
import "../assets/styles/components/Header.scss";
import logo from "../assets/images/vecindario-logo.svg";
import menu from "../assets/images/menu.svg"


const Header = () => {
    return(
        <header>
            <div className="logo__header">
                <img src={logo} alt="Logo Vecindario"/>
            </div>
            <div className="nav__container">
                <Menu/>
            </div>
        </header>
    );
}

function Menu() {
    return (
        <div className="dropdown">
            <label htmlFor="prueba" className="menu__button">
            {/* Zona Administradores */}
                <img src={menu} alt="Hamburger menu" />
            </label>
            <input type="checkbox" id="prueba"></input>
            <div className="dropdown-content">
                <h4 className="dropdown-content__title">Zona Administradores</h4>
                <hr/>
                <a href="menuItem" className="menu-item">
                    Ingresar
                </a>
                <br />
                <a href="menuItem" className="menu-item">
                    Registrarse
                </a>
                <br />
            </div>
    </div>
    );
}

export default Header;