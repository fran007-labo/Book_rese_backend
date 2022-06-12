import { signInWithPopup, GoogleAuthProvider } from 'firebase/auth'
import React from 'react'
import { auth, provider } from "../firebase";
import { useAuthState } from "react-firebase-hooks/auth";

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
      // ...
    }).catch((error) => {
      // Handle Errors here.
      const errorCode = error.code;
      const errorMessage = error.message;
      // The email of the user's account used.
      const email = error.customData.email;
      // The AuthCredential type that was used.
      const credential = GoogleAuthProvider.credentialFromError(error);
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