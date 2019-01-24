package
{
   import flash.display.MovieClip;
   
   public dynamic class TowerCircleNew extends MovieClip
   {
       
      
      public function TowerCircleNew()
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
