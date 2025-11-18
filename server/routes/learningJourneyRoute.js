import  { Router } from 'express';
import { newLearningJourney } from '../controllers/learningJourneyController.js';

const learningJourneyRouter = Router();

learningJourneyRouter.post('/', newLearningJourney);

export default learningJourneyRouter;