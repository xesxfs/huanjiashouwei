package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class effect_Stun_46 extends MovieClip
   {
       
      
      public function effect_Stun_46()
      {
         super();
         addFrameScript(0,this.frame1,26,this.frame27);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame27() : *
      {
         gotoAndPlay("on");
      }
   }
}
