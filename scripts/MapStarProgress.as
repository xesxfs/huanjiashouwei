package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class MapStarProgress extends MovieClip
   {
       
      
      public var progress:TextField;
      
      public function MapStarProgress()
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
