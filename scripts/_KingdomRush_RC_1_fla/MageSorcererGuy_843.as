package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class MageSorcererGuy_843 extends MovieClip
   {
       
      
      public function MageSorcererGuy_843()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,21,this.frame22,42,this.frame43,67,this.frame68,92,this.frame93);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame22() : *
      {
         gotoAndStop("idleDown");
      }
      
      function frame43() : *
      {
         gotoAndStop("idleUp");
      }
      
      function frame68() : *
      {
         gotoAndStop("idleDown");
      }
      
      function frame93() : *
      {
         gotoAndStop("idleUp");
      }
   }
}
