import { signInWithPopup, GoogleAuthProvider } from 'firebase/auth'
import React from 'react'
import { auth, provider } from "../firebase";
import { useAuthState } from "react-firebase-hooks/auth";
import { axios } from 'axios';

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
      // This gives you a Google Access Token. You can use it to access the Google API.
      const credential = GoogleAuthProvider.credentialFromResult(result);
      const token = credential.accessToken;
      // The signed-in user info.
      const user = result.user;

      console.log(token)
      console.log(user.accessToken);
      console.log(user.displayName);
      console.log(user.email);
      console.log(user.uid);
      
      // const url = 'http://localhost:8000/api/v1/users/registrations';
      // axios.post(url, token);
      // ...
    }).catch((error) => {
      // Handle Errors here.
      const errorCode = error.code;
      const errorMessage = error.message;
      // The email of the user's account used.
      const email = error.customData.email;
      // The AuthCredential type that was used.
      const credential = GoogleAuthProvider.credentialFromError(error);
      console.log('error Occur')
      // ...
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
  return (
    <button onClick={() => auth.signOut()}>
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