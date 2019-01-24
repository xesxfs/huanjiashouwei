package
{
   import flash.display.MovieClip;
   
   public class §_-SG§ extends §_-27§
   {
       
      
      public function §_-SG§(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
         EnemyCommon(this.target).§_-7q§();
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         EnemyCommon(this.target).endStun();
         if(param1)
         {
            this.hideDebuff();
         }
         this.destroyThis();
      }
      
      override public function resetToLevel(param1:int) : void
      {
         this.level = param1;
         this.setProperties();
      }
      
      override public function showDebuff() : void
      {
         MovieClip(this.target).effect_stun.gotoAndPlay("on");
      }
      
      override public function hideDebuff() : void
      {
         MovieClip(this.target).effect_stun.gotoAndStop("off");
      }
      
      private function setProperties() : void
      {
         this.durationTime = this.cRoot.gameSettings.heroes.heroMalik.fissureStuntDurationTime * this.cRoot.gameSettings.framesRate;
         this.durationTimeCounter = 0;
         this.showDebuff();
      }
   }
}
