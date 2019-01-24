package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-88§ extends Bolt
   {
       
      
      public function §_-88§(param1:Point, param2:Enemy, param3:int, param4:int)
      {
         addFrameScript(1,this.frame2,10,this.frame11);
         super(param1,param2,param3);
         this.minDamage = param4;
         this.maxDamage = param4;
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBolt();
         this.maxAceleration = 20;
         this.setLevelSettings();
         this.moveMe(true);
      }
      
      override protected function playPop() : void
      {
      }
      
      override protected function setLevelSettings() : void
      {
      }
      
      override protected function hitOnTarget() : void
      {
         this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.M_ARMOR);
         this.playPop();
         this.hit();
      }
      
      function frame2() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
