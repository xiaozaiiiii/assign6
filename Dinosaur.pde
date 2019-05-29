class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  Dinosaur(float x, float y){
    super(x,y);
  }
  
	float currentSpeed = 0.5f;
  float TRIGGERED_SPEED_MULTIPLIER = 5;

	// HINT: Player Detection in update()
	void display(){
    pushMatrix();
    translate(x,y);
    if (currentSpeed > 0 ) {
      scale(1, 1);
      image(dinosaur, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(dinosaur, -w, 0, w, h); 
    }
    popMatrix();
	}

	//If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
	void update(){
    x += 	currentSpeed;
    if( x+SOIL_SIZE >= width || x <= 0){
      currentSpeed = -currentSpeed;
      TRIGGERED_SPEED_MULTIPLIER = -TRIGGERED_SPEED_MULTIPLIER;
    }
    
    if( y == player.y && currentSpeed > 0 && x < player.x || y == player.y && currentSpeed < 0 && x > player.x){
        x += TRIGGERED_SPEED_MULTIPLIER;
    }else{
      x += currentSpeed ;
    }
	}
}
