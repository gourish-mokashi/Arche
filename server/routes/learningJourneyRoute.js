import  { Router } from 'express';
import { getLearningJourneys, newLearningJourney } from '../controllers/learningJourneyController.js';

const learningJourneyRouter = Router();

learningJourneyRouter.post('/', newLearningJourney);

learningJourneyRouter.get('/', getLearningJourneys);

export default learningJourneyRouter;