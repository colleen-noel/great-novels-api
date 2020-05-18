const express = require('express')
const { getAllAuthors, getAuthorByIdIdentifierNovelAndGenre } = require('./controllers/authors.js')
const { getAllNovelsAndAuthorsInAllGenres, getNovelsAndAuthorsByGenre } = require('./controllers/genres.js')
const { getAllNovelsWithAuthorAndGenre, getNovelbySlugType } = require('./controllers/novels')

const app = express()

app.get('/authors', getAllAuthors)

app.get('/authors/:identifier', getAuthorByIdIdentifierNovelAndGenre)

app.get('/genres', getAllNovelsAndAuthorsInAllGenres)

app.get('/genres/:id', getNovelsAndAuthorsByGenre)

app.get('/novels', getAllNovelsWithAuthorAndGenre)

app.get('/novels/:slug', getNovelbySlugType)






app.listen(4004, () => {
  console.log('Listening on port 4004...') // eslint-disable-line no-console
})
