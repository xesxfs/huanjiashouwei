package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class § in§ extends §_-g§
   {
       
      
      public function § in§(param1:Point, param2:Point, param3:Tower, param4:Point)
      {
         addFrameScript(0,this.frame1,16,this.frame17,22,this.frame23,32,this.frame33,41,this.frame42);
         super(param1,param2,param3,param4);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-9k§();
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "ryu";
         param1.sName = Locale.loadStringEx("SOLDIER_PREMIUM_RYU_" + this.§_-Pc§ + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame17() : *
      {
         stop();
      }
      
      function frame23() : *
      {
         stop();
      }
      
      function frame33() : *
      {
         stop();
      }
      
      function frame42() : *
      {
         stop();
      }
   }
}
