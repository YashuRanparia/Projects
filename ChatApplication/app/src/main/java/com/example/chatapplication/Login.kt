package com.example.chatapplication

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth

class Login : AppCompatActivity() {

    private lateinit var edtEmail : EditText
    private lateinit var edtPassword : EditText
    private lateinit var btnLogin : Button
    private lateinit var btnSignUp : Button
    private lateinit var mAuth : FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        supportActionBar?.hide()

        edtEmail = findViewById(R.id.login_email)
        edtPassword = findViewById(R.id.login_password)
        btnLogin = findViewById(R.id.loginBtn)
        btnSignUp = findViewById(R.id.signupBtn)

        mAuth = FirebaseAuth.getInstance()


        //signup button listener
        btnSignUp.setOnClickListener {
            val intent = Intent(this,SignUp::class.java)
            startActivity(intent)
        }



        //Login btn listener
        btnLogin.setOnClickListener{

            //getting the values
            val email = edtEmail.text.toString()
            val password = edtPassword.text.toString()

            Log.d("myDb", "Login Request for $email")
            login(email,password)
        }
    }

    //Login service function
    private fun login(email:String,password:String){
        mAuth.signInWithEmailAndPassword(email, password).addOnCompleteListener(this){
            task->
            if(task.isSuccessful){
                Log.d("myDb", "login: Successful!")
                val intent = Intent(this@Login,MainActivity::class.java)
                finish()
                startActivity(intent)
            }else{
                Toast.makeText(this@Login,"User does not Exists!",Toast.LENGTH_SHORT).show()
            }
        }
    }
}