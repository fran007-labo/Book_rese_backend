import { signInWithPopup } from 'firebase/auth'
import React from 'react'
import { auth, provider } from "../firebase";
import { useAuthState } from "react-firebase-hooks/auth";
import axios from 'axios';

export default function Home() {
  const [user] = useAuthState(auth);

  return (
    <div>
      {user ? ( 
        <>
          <UserInfo />
          <SingOutButton />
        </>
      ) : (
        <SingInButton />
      )}
    </div>
  )
}

// サインイン 
function SingInButton() {
  const SingInWithGoogle = () => {
    signInWithPopup(auth, provider)
    .then((result) => {
      const url = 'http://localhost:8000/api/v1/registrations';
      const user = result.user
      const data = { name: user.displayName, email: user.email, uid: user.uid }
      user.getIdToken().then(idToken => {
        axios.post(url, { token: idToken, registration: data });
      })

    }).catch((error) => {
      console.log('error Occur')
    });
  } 
  return (
    <button onClick={SingInWithGoogle}>
      <p>グーグルでサインイン</p>
    </button>
  )
}

// サインアウト
function SingOutButton() {
  const singOut = () => {
    const url = 'http://localhost:8000/api/v1/sign_outs'
    axios.post(url);
    auth.signOut();
  }

  return (
    <button onClick={() => singOut()}>
      <p>サインアウト</p>
    </button>
  )
}

function UserInfo() {
  return (
    <div className="userInfo">
      <img src={auth.currentUser.photoURL} alt="" />
      <p>{auth.currentUser.displayName}</p>
    </div>
  );
}