package
{
   import flash.display.MovieClip;
   
   public class DebuffCurse extends §_-27§
   {
       
      
      public var §_-LX§:int;
      
      public var §_-IG§:int;
      
      public var §var §:int;
      
      public var §_-RP§:int;
      
      public var §_-89§:int;
      
      public function DebuffCurse(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
         this.§_-IG§ = this.target.armor * this.§_-LX§ / 100;
         this.target.armor = this.target.armor - this.§_-IG§;
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
         this.target.armor = this.target.armor + this.§_-IG§;
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
         MovieClip(this.target).debuff_Cursed.gotoAndPlay("on");
      }
      
      override public function hideDebuff() : void
      {
         MovieClip(this.target).debuff_Cursed.gotoAndStop("off");
      }
      
      override public function runOnFrame() : void
      {
         if(this.§_-89§ < this.§_-RP§)
         {
            this.§_-89§++;
            return;
         }
         Enemy(this.target).setDamage(this.§var §);
         this.§_-89§ = 0;
      }
      
      private function setProperties() : void
      {
         switch(this.level)
         {
            case 1:
               this.§_-LX§ = this.cRoot.gameSettings.mages.sorcerer.curseArmorReduce;
               this.§var § = this.cRoot.gameSettings.mages.sorcerer.curseDamage;
               this.§_-RP§ = this.cRoot.gameSettings.framesRate;
               this.durationTime = this.cRoot.gameSettings.mages.sorcerer.curseDuration;
         }
         this.showDebuff();
         this.durationTimeCounter = 0;
         this.§_-89§ = 0;
      }
   }
}
