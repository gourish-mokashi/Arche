import { searchYouTube } from "./ytSearch.js";
import prisma from "../exports/prisma.js";

async function findRelevantVideoMaterials(subTopics, maxResults = 3) {


    for (const topic of subTopics) {
        const query = `${topic.description}`;
        // strip characters to the left of :
        const colonIndex = query.indexOf(':');
        const cleanedQuery = colonIndex !== -1 ? query.slice(colonIndex + 1).trim() : query;
        try {
            const searchResults = await searchYouTube(cleanedQuery, maxResults);
            await prisma.videoResource.createMany({
                data: searchResults.map(video => ({
                    title: video.snippet.title,
                    url: `https://www.youtube.com/watch?v=${video.id.videoId}`,
                    subTopicId: topic.id,
                    duration: 30
                }))
            });
            
        } catch (error) {
            console.error(`Error fetching videos for topic "${topic}":`, error);
        }
    }
}

export default findRelevantVideoMaterials;