package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class buff_rage_105 extends MovieClip
   {
       
      
      public function buff_rage_105()
      {
         super();
         addFrameScript(0,this.frame1,28,this.frame29);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame29() : *
      {
         gotoAndPlay("on");
      }
   }
}
