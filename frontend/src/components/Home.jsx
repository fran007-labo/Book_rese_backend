import { signInWithPopup } from '@firebase/auth'
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
    signInWithPopup(auth, provider);
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