package
{
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class NotificationSecondLevelHolder extends Sprite
   {
       
      
      public var notificationSelected:NotificationSecondLevel;
      
      protected var §_-8W§:Boolean;
      
      protected var level:Level;
      
      protected var initNotificationPoint:Point;
      
      protected var §_-PF§:int;
      
      protected var notificationCount:int;
      
      public function NotificationSecondLevelHolder(param1:Level)
      {
         super();
         this.level = param1;
         this.§_-PF§ = 65;
         this.notificationCount = 0;
         if(this.level.game.gameUpgrades.heroRoomEnabled && this.level.game.gameUpgrades.selectedHero != 0)
         {
            this.initNotificationPoint = new Point(43,70);
         }
         else
         {
            this.initNotificationPoint = new Point(23,5);
         }
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            NotificationSecondLevel(this.getChildAt(_loc1_)).update();
            _loc1_++;
         }
      }
      
      public function closeSelected() : void
      {
         this.notificationSelected.closeMe();
      }
      
      public function addNotification(param1:String) : void
      {
         if(this.§_-Cj§(param1))
         {
            return;
         }
         var _loc2_:NotificationSecondLevel = new NotificationSecondLevel(this.level,param1);
         this.§_-6s§(_loc2_.pauseNotification);
         this.notificationCount++;
         _loc2_.position = this.notificationCount;
         _loc2_.x = this.initNotificationPoint.x;
         _loc2_.y = this.initNotificationPoint.y + this.§_-PF§ * this.notificationCount;
         if(!this.§_-8W§ && this.level.data.levelIndex == 0)
         {
            Level1(this.level).notificationSign = new SignNewNotification(new Point(85,100),Level1(this.level));
            this.level.bullets.addChild(Level1(this.level).notificationSign);
            this.§_-8W§ = true;
         }
         this.addChild(_loc2_);
      }
      
      public function §_-Cj§(param1:String) : Boolean
      {
         switch(param1)
         {
            case "NotificationEnemyGoblin":
               return this.level.game.gameEncyclopedia.notificationEnemyGoblin;
            case "NotificationEnemyFatOrc":
               return this.level.game.gameEncyclopedia.notificationEnemyFatOrc;
            case "NotificationEnemyOgre":
               return this.level.game.gameEncyclopedia.notificationEnemyOgre;
            case "NotificationEnemyWolfSmall":
               return this.level.game.gameEncyclopedia.notificationEnemySmallWolf;
            case "NotificationEnemyShaman":
               return this.level.game.gameEncyclopedia.notificationEnemyShaman;
            case "NotificationEnemyBandit":
               return this.level.game.gameEncyclopedia.notificationEnemyBandit;
            case "NotificationEnemyBrigand":
               return this.level.game.gameEncyclopedia.notificationEnemyBrigand;
            case "NotificationEnemyDarkKnight":
               return this.level.game.gameEncyclopedia.notificationEnemyDarkKnight;
            case "NotificationEnemyGargoyle":
               return this.level.game.gameEncyclopedia.notificationEnemyGargoyle;
            case "NotificationEnemyMarauder":
               return this.level.game.gameEncyclopedia.notificationEnemyMarauder;
            case "NotificationEnemyWolf":
               return this.level.game.gameEncyclopedia.notificationEnemyWolf;
            case "NotificationEnemyWhiteWolf":
               return this.level.game.gameEncyclopedia.notificationEnemyWhiteWolf;
            case "NotificationEnemyShadowArcher":
               return this.level.game.gameEncyclopedia.notificationEnemyShadowArcher;
            case "NotificationEnemySpider":
               return this.level.game.gameEncyclopedia.notificationEnemySpider;
            case "NotificationEnemySpiderSmall":
               return this.level.game.gameEncyclopedia.notificationEnemySpiderSmall;
            case "NotificationEnemyTroll":
               return this.level.game.gameEncyclopedia.notificationEnemyTroll;
            case "NotificationEnemyTrollAxeThrower":
               return this.level.game.gameEncyclopedia.notificationEnemyTrollAxeThrower;
            case "NotificationEnemyTrollChieftain":
               return this.level.game.gameEncyclopedia.notificationEnemyTrollChieftain;
            case "NotificationEnemyYeti":
               return this.level.game.gameEncyclopedia.notificationEnemyYeti;
            case "NotificationEnemySlayer":
               return this.level.game.gameEncyclopedia.notificationEnemyDarkSlayer;
            case "NotificationEnemyRocketeer":
               return this.level.game.gameEncyclopedia.notificationEnemyRocketeer;
            case "NotificationEnemyDemon":
               return this.level.game.gameEncyclopedia.notificationEnemyDemon;
            case "NotificationEnemyDemonMage":
               return this.level.game.gameEncyclopedia.notificationEnemyDemonMage;
            case "NotificationEnemyDemonWolf":
               return this.level.game.gameEncyclopedia.notificationEnemyDemonWolf;
            case "NotificationEnemyDemonImp":
               return this.level.game.gameEncyclopedia.notificationEnemyDemonImp;
            case "NotificationEnemyNecromancer":
               return this.level.game.gameEncyclopedia.notificationEnemyNecromancer;
            case "NotificationEnemyLavaElemental":
               return this.level.game.gameEncyclopedia.notificationEnemyLavaElemental;
            case "NotificationEnemySarelgazSmall":
               return this.level.game.gameEncyclopedia.notificationEnemySarelgazSmall;
            case "NotificationEnemyOrcArmored":
               return this.level.game.gameEncyclopedia.notificationEnemyOrcArmored;
            case "NotificationEnemyGoblinZapper":
               return this.level.game.gameEncyclopedia.notificationEnemyGoblinZapper;
            case "NotificationEnemyOrcWolfRider":
               return this.level.game.gameEncyclopedia.notificationEnemyOrcWolfRider;
            case "NotificationEnemyForestTroll":
               return this.level.game.gameEncyclopedia.notificationEnemyForestTroll;
            case "NotificationEnemyZombie":
               return this.level.game.gameEncyclopedia.notificationEnemyZombie;
            case "NotificationEnemyRottenSpider":
               return this.level.game.gameEncyclopedia.notificationEnemyRottenSpider;
            case "NotificationEnemyRottenTree":
               return this.level.game.gameEncyclopedia.notificationEnemyRottenTree;
            case "NotificationEnemyThing":
               return this.level.game.gameEncyclopedia.notificationEnemySwampThing;
            case "NotificationEnemyRaider":
               return this.level.game.gameEncyclopedia.notificationEnemyRaider;
            case "NotificationEnemyPillager":
               return this.level.game.gameEncyclopedia.notificationEnemyPillager;
            case "NotificationTipArmorMagic":
               if(this.level.mode == GameSettings.§_-OS§)
               {
                  return false;
               }
               break;
            case "NotificationTipArmor":
               if(this.level.mode == GameSettings.§_-OS§)
               {
                  return false;
               }
               break;
            case "NotificationTipRallyPoint":
               if(this.level.mode == GameSettings.§_-OS§)
               {
                  return false;
               }
               break;
            case "NotificationTipHeroes":
               if(this.level.game.heroShow)
               {
                  return false;
               }
               break;
         }
         return false;
      }
      
      public function §_-6s§(param1:String) : void
      {
         switch(param1)
         {
            case "NotificationEnemyGoblin":
               this.level.game.gameEncyclopedia.notificationEnemyGoblin = true;
               break;
            case "NotificationEnemyFatOrc":
               this.level.game.gameEncyclopedia.notificationEnemyFatOrc = true;
               break;
            case "NotificationEnemyOgre":
               this.level.game.gameEncyclopedia.notificationEnemyOgre = true;
               break;
            case "NotificationEnemyWolfSmall":
               this.level.game.gameEncyclopedia.notificationEnemySmallWolf = true;
               break;
            case "NotificationEnemyShaman":
               this.level.game.gameEncyclopedia.notificationEnemyShaman = true;
               break;
            case "NotificationEnemyBandit":
               this.level.game.gameEncyclopedia.notificationEnemyBandit = true;
               break;
            case "NotificationEnemyBrigand":
               this.level.game.gameEncyclopedia.notificationEnemyBrigand = true;
               break;
            case "NotificationEnemyDarkKnight":
               this.level.game.gameEncyclopedia.notificationEnemyDarkKnight = true;
               break;
            case "NotificationEnemyGargoyle":
               this.level.game.gameEncyclopedia.notificationEnemyGargoyle = true;
               break;
            case "NotificationEnemyMarauder":
               this.level.game.gameEncyclopedia.notificationEnemyMarauder = true;
               break;
            case "NotificationEnemyWolf":
               this.level.game.gameEncyclopedia.notificationEnemyWolf = true;
               break;
            case "NotificationEnemyWhiteWolf":
               this.level.game.gameEncyclopedia.notificationEnemyWhiteWolf = true;
               break;
            case "NotificationEnemyShadowArcher":
               this.level.game.gameEncyclopedia.notificationEnemyShadowArcher = true;
               break;
            case "NotificationEnemySpider":
               this.level.game.gameEncyclopedia.notificationEnemySpider = true;
               break;
            case "NotificationEnemySpiderSmall":
               this.level.game.gameEncyclopedia.notificationEnemySpiderSmall = true;
               break;
            case "NotificationEnemyTroll":
               this.level.game.gameEncyclopedia.notificationEnemyTroll = true;
               break;
            case "NotificationEnemyTrollAxeThrower":
               this.level.game.gameEncyclopedia.notificationEnemyTrollAxeThrower = true;
               break;
            case "NotificationEnemyTrollChieftain":
               this.level.game.gameEncyclopedia.notificationEnemyTrollChieftain = true;
               break;
            case "NotificationEnemyYeti":
               this.level.game.gameEncyclopedia.notificationEnemyYeti = true;
               break;
            case "NotificationEnemySlayer":
               this.level.game.gameEncyclopedia.notificationEnemyDarkSlayer = true;
               break;
            case "NotificationEnemyRocketeer":
               this.level.game.gameEncyclopedia.notificationEnemyRocketeer = true;
               break;
            case "NotificationEnemyDemon":
               this.level.game.gameEncyclopedia.notificationEnemyDemon = true;
               break;
            case "NotificationEnemyDemonMage":
               this.level.game.gameEncyclopedia.notificationEnemyDemonMage = true;
               break;
            case "NotificationEnemyDemonWolf":
               this.level.game.gameEncyclopedia.notificationEnemyDemonWolf = true;
               break;
            case "NotificationEnemyDemonImp":
               this.level.game.gameEncyclopedia.notificationEnemyDemonImp = true;
               break;
            case "NotificationEnemyNecromancer":
               this.level.game.gameEncyclopedia.notificationEnemyNecromancer = true;
               break;
            case "NotificationEnemyLavaElemental":
               this.level.game.gameEncyclopedia.notificationEnemyLavaElemental = true;
               break;
            case "NotificationEnemySarelgazSmall":
               this.level.game.gameEncyclopedia.notificationEnemySarelgazSmall = true;
               break;
            case "NotificationEnemyOrcArmored":
               this.level.game.gameEncyclopedia.notificationEnemyOrcArmored = true;
               break;
            case "NotificationEnemyGoblinZapper":
               this.level.game.gameEncyclopedia.notificationEnemyGoblinZapper = true;
               break;
            case "NotificationEnemyOrcWolfRider":
               this.level.game.gameEncyclopedia.notificationEnemyOrcWolfRider = true;
               break;
            case "NotificationEnemyForestTroll":
               this.level.game.gameEncyclopedia.notificationEnemyForestTroll = true;
               break;
            case "NotificationEnemyZombie":
               this.level.game.gameEncyclopedia.notificationEnemyZombie = true;
               break;
            case "NotificationEnemyRottenSpider":
               this.level.game.gameEncyclopedia.notificationEnemyRottenSpider = true;
               break;
            case "NotificationEnemyRottenTree":
               this.level.game.gameEncyclopedia.notificationEnemyRottenTree = true;
               break;
            case "NotificationEnemyThing":
               this.level.game.gameEncyclopedia.notificationEnemySwampThing = true;
               break;
            case "NotificationEnemyRaider":
               this.level.game.gameEncyclopedia.notificationEnemyRaider = true;
               break;
            case "NotificationEnemyPillager":
               this.level.game.gameEncyclopedia.notificationEnemyPillager = true;
         }
      }
      
      public function removeNotification(param1:int) : void
      {
         if(param1 == this.notificationCount)
         {
            this.notificationCount--;
            return;
         }
         var _loc2_:int = param1 + 1;
         while(_loc2_ <= this.notificationCount)
         {
            NotificationSecondLevel(this.getChildAt(_loc2_ - 1)).moveTo(this.initNotificationPoint.y + this.§_-PF§ * (_loc2_ - 1));
            _loc2_++;
         }
         this.notificationCount--;
      }
      
      protected function destroyThis() : void
      {
         this.level = null;
         this.parent.removeChild(this);
      }
   }
}
