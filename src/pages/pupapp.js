import React, { useState } from "react"
import AddPetForm from "../components/forms/add_pet_form"
import './temp.css'
import { Router } from "@reach/router"
import LoginScreen from "../screens/login"
import firebaseConfig from "../config"
import firebase from 'firebase'
import RecoveryScreen from "../screens/recovery"

firebase.initializeApp(firebaseConfig);

export default function PupaApp() {
  const [user, setUser] = useState();

  return <Router basepath='/pupapp'>
    {!user ? <LoginScreen path='/' /> : <div />}
  </Router>

}

