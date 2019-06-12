class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class
  Laser laser;
  Robot(float x, float y){
    super(x,y);
    laser = new Laser();
  }
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  int laserTimer = 180;
  
  
  void display(){
    pushMatrix();
    translate(x,y);
    if (speed > 0) {
      scale(1, 1);
      image(robot, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(robot, -w, 0, w, h); 
    }
    popMatrix();
    
    laser.display();
  }
	// HINT: Player Detection in update()
  void update(){
    
    laser.update();
    laser.checkCollision(player);
    
    boolean checkX = false;
    boolean checkY = false;
    
    if( speed > 0 && x < player.x || speed < 0 && x > player.x ){
      checkX = true;
    }else{
      checkX = false;
    }

    if( player.y >= y - SOIL_SIZE * 2 && player.y <= y + SOIL_SIZE * 2){
      checkY = true ;
    }else{
      checkY = false;
    }    
   
    
	
  	if(checkX && checkY){
      
      if(laserTimer == LASER_COOLDOWN){
      
        //laser.checkCollision();
        if(x < player.x){
        laser.fire(x + HAND_OFFSET_X_FORWARD, y + HAND_OFFSET_Y, player.x, player.y);
        laserTimer = 0;
        }
        if(x > player.x){
        laser.fire(x + HAND_OFFSET_X_BACKWARD, y + HAND_OFFSET_Y, player.x, player.y);
        laserTimer = 0;
        }
        
      }
      if(laserTimer < LASER_COOLDOWN){
        //laser.checkCollision();
        laserTimer ++;
      }
      return;
     
  		//Is laser's cooldown ready?
  	  //True  > Fire laser from my hand!
  		//False > Don't do anything
  	}else{
  		//Keep moving
      x += speed ;
      if(x + SOIL_SIZE >= width || x <= 0){
      speed = -speed;
      }
    }
  }
}
