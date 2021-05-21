import React from "react";
import "../assets/styles/components/CardProject.scss";
import imgArea from "../assets/images/icon_area.svg"
import imgParking from "../assets/images/icon_car.svg"
import imgRestroom from "../assets/images/icon_toilet.svg"
import imgProject from "../assets/images/img_project.png"

const CardProject = () => {
    return (
        <div className="container__card--project">
            <div className="card__project--header">
                <h2 className="name_project">Kamelot</h2>
                <h3 className="type_project">residencial</h3>
                <div className="header--ubication">
                    <p className="city">Sabaneta:</p>
                    <p className="address">Carrera 45A # 79 sur - 134</p>
                </div>
                <div>
                    <img src={imgProject} alt="project"/>
                </div>
            </div>
            <div className="card__project--body">
                <h2>Precio final desde:</h2>
                <p className="price">209 millones*</p>
                <div className="body--aminities">
                    <div className="body--aminities-area">
                        <img src={imgArea} alt="" />
                        <p className="area">63mt<sup>2</sup></p>
                    </div>
                    <div className="body--aminities-parking">
                        <img src={imgParking} alt="" />
                        <p className="parking">incluido</p>
                    </div>
                    <div className="body--aminities-restroom">
                        <img src={imgRestroom} alt="" />
                        <p className="restroom">2 baños</p>
                    </div>
                </div>
                <p className="subsidy">Aplica subsidio</p>
                <button className="btn__lead">Estoy interezado</button>
            </div>
        </div>
    );
}

export default CardProject;