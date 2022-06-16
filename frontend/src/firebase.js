import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider } from "firebase/auth"

const firebaseConfig = {
  apiKey: "AIzaSyC6NQtuu3op3ABHCibHGx8r0NxAl9Wq5oI",
  authDomain: "book-reservation-a456f.firebaseapp.com",
  projectId: "book-reservation-a456f",
  storageBucket: "book-reservation-a456f.appspot.com",
  messagingSenderId: "1029790200219",
  appId: "1:1029790200219:web:dfff1f1c5aca4cc2fc713e",
  measurementId: "G-F86Q0S66NT"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

export { auth, provider };