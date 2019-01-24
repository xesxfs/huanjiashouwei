package
{
   import flash.display.MovieClip;
   
   public dynamic class NotificationClose extends MovieClip
   {
       
      
      public function NotificationClose()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
