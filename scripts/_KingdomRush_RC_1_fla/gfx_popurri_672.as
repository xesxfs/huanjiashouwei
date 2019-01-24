package _KingdomRush_RC_1_fla
{
   import flash.display.MovieClip;
   
   public dynamic class gfx_popurri_672 extends MovieClip
   {
       
      
      public function gfx_popurri_672()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         gotoAndStop(Math.round(Math.random() * 5));
      }
   }
}
