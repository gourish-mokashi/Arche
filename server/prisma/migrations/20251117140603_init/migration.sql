-- CreateEnum
CREATE TYPE "skillLevel" AS ENUM ('BEGINNER', 'INTERMEDIATE', 'ADVANCED');

-- CreateEnum
CREATE TYPE "prefferedLanguage" AS ENUM ('ENGLISH', 'HINDI');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "learningJourney" (
    "id" TEXT NOT NULL,
    "topicName" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "learningJourney_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "learningPreference" (
    "id" TEXT NOT NULL,
    "mainTopicName" TEXT NOT NULL,
    "skillLevel" "skillLevel" NOT NULL,
    "language" "prefferedLanguage" NOT NULL,
    "hoursPerDay" INTEGER NOT NULL,
    "MonthsToComplete" INTEGER NOT NULL,
    "learningJourneyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "learningPreference_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "learningJourney_userId_idx" ON "learningJourney"("userId");

-- CreateIndex
CREATE INDEX "learningPreference_learningJourneyId_idx" ON "learningPreference"("learningJourneyId");

-- AddForeignKey
ALTER TABLE "learningJourney" ADD CONSTRAINT "learningJourney_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "learningPreference" ADD CONSTRAINT "learningPreference_learningJourneyId_fkey" FOREIGN KEY ("learningJourneyId") REFERENCES "learningJourney"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
