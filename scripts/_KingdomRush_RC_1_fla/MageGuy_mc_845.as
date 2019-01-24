package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class MageGuy_mc_845 extends MovieClip
   {
       
      
      public function MageGuy_mc_845()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,15,this.frame16,30,this.frame31);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame16() : *
      {
         gotoAndStop("idleDown");
      }
      
      function frame31() : *
      {
         gotoAndStop("idleUp");
      }
   }
}
