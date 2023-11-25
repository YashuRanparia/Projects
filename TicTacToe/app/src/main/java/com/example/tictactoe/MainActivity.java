package com.example.tictactoe;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    boolean gameActive = true;
    //0 -> X
    //1 -> o
    int activeplayer = 0;
    int[] gameState = { 2,2,2,2,2,2,2,2,2};

    int[][] winPosition = {{0,1,2}, {3,4,5}, {6,7,8},
                           {0,3,6}, {1,4,7}, {2,5,8},
                           {0,4,8}, {2,4,6}};
    public void playerTap(View view){
        ImageView img = (ImageView) view;
        int tappedImage = Integer.parseInt(img.getTag().toString());
        if(!gameActive){
            gameReset(view);
        }
        if(gameState[tappedImage-1] == 2){
            gameState[tappedImage-1] = activeplayer;
            img.setTranslationY(-1000f);
            if(activeplayer == 0){
                img.setImageResource(R.drawable.cross2);
                activeplayer = 1;
                TextView stats = findViewById(R.id.status);
                stats.setText("Turn of Player-2");
            }else{
                img.setImageResource(R.drawable.circle2);
                activeplayer = 0;
                TextView stats = findViewById(R.id.status);
                stats.setText("Turn of Player-1");
            }
            img.animate().translationYBy(1000f).setDuration(300);
        }
        for(int[] winPosition: winPosition){
            if(gameState[winPosition[0]] == gameState[winPosition[1]]  &&
                    gameState[winPosition[0]] == gameState[winPosition[2]] &&
                    gameState[winPosition[0]] != 2){
                String winner;
                gameActive = false;
                if(gameState[winPosition[0]] == 0){
                    winner = "Player-1 has won!";
                }else{
                    winner = "PLayer-2 has won";
                }
                TextView stats = findViewById(R.id.status);
                stats.setText(winner);
            }
        }
    }

    public void gameReset(View view){
        gameActive = true;
        activeplayer = 0;
        for(int i = 0;i<gameState.length; i++){
            gameState[i] = 2;
        }
        ((ImageView)findViewById(R.id.imageView1)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView2)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView3)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView4)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView5)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView6)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView7)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView8)).setImageResource(0);
        ((ImageView)findViewById(R.id.imageView9)).setImageResource(0);
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}