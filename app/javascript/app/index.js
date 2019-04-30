import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App";
import Home from "./components/Home";

document.addEventListener("DOMContentLoaded", () => {
    const home = document.querySelector("#home");
    ReactDOM.render(<App />, home);
});