import { google } from "googleapis"
import dotenv from "dotenv"

dotenv.config()

const youtube = google.youtube({
    version: "v3",
    auth: process.env.GOOGLE_YT_API_KEY,
})

async function searchYouTube(query, maxResults = 10) {
    const response = await youtube.search.list({
        part: ["snippet"],
        q: query,
        maxResults: maxResults,
        type: ["video"],
    })
    return response.data.items
}
export { searchYouTube }