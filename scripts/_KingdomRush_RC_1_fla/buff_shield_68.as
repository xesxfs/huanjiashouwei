package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class buff_shield_68 extends MovieClip
   {
       
      
      public function buff_shield_68()
      {
         super();
         addFrameScript(0,this.frame1,11,this.frame12);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame12() : *
      {
         gotoAndPlay("on");
      }
   }
}
