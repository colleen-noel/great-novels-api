const express = require('express')
const { getAllAuthors, getAuthorByIdWithNovelAndGenre } = require('./controllers/authors.js')
const { getAllNovelsAndAuthorsInAllGenres, getNovelsAndAuthorsByGenre } = require('./controllers/genres.js')
const { getAllNovelsWithAuthorAndGenre, getNovelByIdWithAuthorAndGenre } = require('./controllers/novels')

const app = express()

app.get('/authors', getAllAuthors)

app.get('/authors/:id', getAuthorByIdWithNovelAndGenre)

app.get('/genres', getAllNovelsAndAuthorsInAllGenres)

app.get('/genres/:id', getNovelsAndAuthorsByGenre)

app.get('/novels', getAllNovelsWithAuthorAndGenre)

app.get('/novels/:id', getNovelByIdWithAuthorAndGenre)



app.listen(4004, () => {
  console.log('Listening on port 4004...') // eslint-disable-line no-console
})
