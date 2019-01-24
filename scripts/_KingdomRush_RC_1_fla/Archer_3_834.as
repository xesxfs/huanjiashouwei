package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class Archer_3_834 extends MovieClip
   {
       
      
      public function Archer_3_834()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,9,this.frame10,17,this.frame18);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame10() : *
      {
         gotoAndStop("idleDown");
      }
      
      function frame18() : *
      {
         gotoAndStop("idleUp");
      }
   }
}
