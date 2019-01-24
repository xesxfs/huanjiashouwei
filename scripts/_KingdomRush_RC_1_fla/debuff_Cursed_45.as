package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class debuff_Cursed_45 extends MovieClip
   {
       
      
      public function debuff_Cursed_45()
      {
         super();
         addFrameScript(0,this.frame1,15,this.frame16);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame16() : *
      {
         gotoAndPlay("on");
      }
   }
}
