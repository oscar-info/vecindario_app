import React from 'react'
import "../assets/styles/components/Home.scss"
import Header from "../components/Header"
import Footer from "../components/Footer"
import CardProject from "../components/CardProject"

function Home(){
    return (
        <div className="home">
            <Header/>
            <div className="container__projects">
                <CardProject/>
            </div>
            <Footer/>
        </div>
    )
}

export default Home;