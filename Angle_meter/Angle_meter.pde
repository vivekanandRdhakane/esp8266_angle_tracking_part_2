 //Processing sketch to run with this example
 // =====================================================

  // Processing UDP example to send and receive string data from Arduino
  // press any key to send the "Hello Arduino" message


  import hypermedia.net.*;

  UDP udp;  // define the UDP object
 Float angle_X,angle_Y,angle_Z;

  void setup() {
    size(300,300);
  udp = new UDP( this, 4210 );  // create a new datagram connection on port 6000
  //udp.log( true );     // <-- printout the connection activity
  udp.listen( true );           // and wait for incoming message
    println("IP="+udp.address ());

  }

  void draw()
  {
    background(255);
    textSize(20);
    fill(0);
    text("angle_X= "+int(angle_X)+"°"+"\n"+"angle_Y= "+int(angle_Y)+"°"+"\n"+"angle_Z= "+int(angle_Z )+"°",100,150);
  }

  void keyPressed() {
  String ip       = "192.168.43.203";  // the remote IP address
  int port        = 4210;    // the destination port

  udp.send("Hello World", ip, port );   // the message to send

  }

  void receive( byte[] message ) {       // <-- default handler
  //void receive( byte[] data, String ip, int port ) {  // <-- extended handler
String data =new String(message);
      data = data.substring(1,data.length());
  for(int i=0; i < message.length; i++)
 {
      //print(char(message[i]));
 }
 
 
  println(data);
 
  //println("in ACC_cal");
  
      int index2 =data.indexOf("!");
      String ax = data.substring(0, index2);
      
      int index4 =data.indexOf("@");
      String ay = data.substring(index2+1, index4);
      
      int index6 =data.indexOf("*");
      String az = data.substring(index4+1, index6);
       
     angle_X = Float.parseFloat(ax) ;//-X_offset;
      angle_Y = Float.parseFloat(ay) ;//-Y_offset;
      angle_Z = Float.parseFloat(az) ;//-Z_offset;
           /*  print(">"+ax+"<")  ; 
         print(" ");    
             print(">"+ay+"<")  ; 
                print(" ");    
             print(">"+az+"<")  ; 
             
              print("|"+angle_X+"|")  ; 
              print(" ");    
             print("|"+angle_Y+"|")  ; 
              print(" ");    
             print("|"+angle_Z+"|")  ; */

      
  }
