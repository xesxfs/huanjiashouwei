package
{
   import com.mosesSupposes.bitmap.InteractivePNG;
   
   public dynamic class ButUpgrades extends InteractivePNG
   {
       
      
      public function ButUpgrades()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
