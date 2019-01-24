package
{
   import flash.display.MovieClip;
   
   public dynamic class GTowerSoldierStandar1 extends MovieClip
   {
       
      
      public function GTowerSoldierStandar1()
      {
         super();
         addFrameScript(0,this.frame1,24,this.frame25);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame25() : *
      {
         gotoAndStop("idle");
      }
   }
}
