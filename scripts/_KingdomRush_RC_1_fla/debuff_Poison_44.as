package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class debuff_Poison_44 extends MovieClip
   {
       
      
      public function debuff_Poison_44()
      {
         super();
         addFrameScript(0,this.frame1,12,this.frame13);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame13() : *
      {
         gotoAndPlay("on");
      }
   }
}
