package
{
   import flash.display.MovieClip;
   
   public class DebuffPoison extends §_-27§
   {
       
      
      public var §var §:int;
      
      public var §_-RP§:int;
      
      public var §_-89§:int;
      
      public function DebuffPoison(param1:Level, param2:int, param3:Enemy)
      {
         super(param1,param2,param3);
      }
      
      override public function init() : void
      {
         this.setProperties();
      }
      
      override public function runOnFrame() : void
      {
         if(this.§_-89§ < this.§_-RP§)
         {
            this.§_-89§++;
            return;
         }
         Enemy(this.target).setDamage(this.§var §,this.cRoot.gameSettings.I_ARMOR,null);
         if(this.target != null && this.target.isDead)
         {
            this.cRoot.game.gameAchievement.poisonEnemy(this.cRoot);
         }
         this.§_-89§ = 0;
      }
      
      override public function removeDebuff(param1:Boolean) : void
      {
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
         if(MovieClip(this.target).debuff_Poison)
         {
            MovieClip(this.target).debuff_Poison.gotoAndPlay("on");
         }
      }
      
      override public function hideDebuff() : void
      {
         if(MovieClip(this.target).debuff_Poison)
         {
            MovieClip(this.target).debuff_Poison.gotoAndStop("off");
         }
      }
      
      private function setProperties() : void
      {
         this.§var § = this.cRoot.gameSettings.archers.ranger.poisonDamage * this.level;
         this.§_-RP§ = this.cRoot.gameSettings.framesRate;
         this.durationTime = this.cRoot.gameSettings.archers.ranger.poisonDuration;
         this.showDebuff();
         this.durationTimeCounter = 0;
         this.§_-89§ = 0;
      }
   }
}
