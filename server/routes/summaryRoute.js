import { Router } from "express";
import { uploadFile, generateSummary, getSummary, getUserSummaries, getFollowUp } from "../controllers/summaryController.js";
import { upload } from "../lib/multer.js";
const summaryRouter = Router()

summaryRouter.get("/generate", generateSummary);

summaryRouter.post("/upload", upload.single('file'), uploadFile);

summaryRouter.get("/", getSummary)

summaryRouter.get("/list", getUserSummaries);

summaryRouter.post("/follow-up", getFollowUp)


export default summaryRouter;