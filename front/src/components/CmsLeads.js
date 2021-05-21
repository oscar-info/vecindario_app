import React from "react";


function CmsLeads() {
    return(
        <div className="container__cms--leads">
            <div>
                <h2>Kamelot</h2>
                <div className="resum__leads">
                    <p>4</p>
                </div>
            </div>
            <section>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Fecha</th> 
                            <th>Email</th>
                            <th>Telefono</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Oscar Info</td>
                            <td>12/04/2021</td>
                            <td>prueba@gmail.com</td>
                            <td>3192337645</td>
                        </tr>
                        <tr>
                            <td>Eve</td>
                            <td>Jackson</td>
                            <td>94</td>
                            <td>50</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
    )
}

export default CmsLeads;