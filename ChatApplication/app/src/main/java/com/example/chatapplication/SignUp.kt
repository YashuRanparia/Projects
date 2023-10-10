package com.example.chatapplication

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.ktx.Firebase

class SignUp : AppCompatActivity() {

    private lateinit var edtEmail : EditText
    private lateinit var edtName : EditText
    private lateinit var edtPassword : EditText
    private lateinit var btnSignUp : Button
    private lateinit var mAuth : FirebaseAuth
    private lateinit var mDbRef : DatabaseReference

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sign_up)

        supportActionBar?.hide()

        edtEmail = findViewById(R.id.signup_email)
        edtName = findViewById(R.id.signup_name)
        edtPassword = findViewById(R.id.signup_password)
        btnSignUp = findViewById(R.id.signupBtn)

        mAuth = FirebaseAuth.getInstance()

        btnSignUp.setOnClickListener {
            val name = edtName.text.toString()
            val email = edtEmail.text.toString()
            val password = edtPassword.text.toString()
            signUp(name,email,password)
        }
    }

    private fun signUp(name: String,email:String,password:String){
        mAuth.createUserWithEmailAndPassword(email,password).addOnCompleteListener(this) {
            task ->
            if(task.isSuccessful){
                addUserToDatabase(name,email,mAuth.currentUser?.uid!!)
                val intent = Intent(this@SignUp,Login::class.java)
                finish()
                startActivity(intent)
            }else{
                Toast.makeText(this@SignUp, "Some Error Occurred!", Toast.LENGTH_SHORT).show()
            }
        }
    }

    public fun addUserToDatabase(name: String, email: String, uid: String){
        mDbRef = FirebaseDatabase.getInstance().getReference()

        mDbRef.child("user").child(uid).setValue(User(name,email,uid))
    }
}