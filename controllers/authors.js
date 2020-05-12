const models = require('../models')

const getAllAuthors = async (request, response) => {
  try {
    const authors = await models.Authors.findAll()

    return (authors)
      ? response.send(authors)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Unable to retrieve authors, please try again')
  }
}


const getAuthorByIdWithNovelAndGenre = async (request, response) => {
  try {
    const { id } = request.params

    const authorById = await models.Authors.findOne({
      where: { Id: id },
      include: [{
        model: models.Novels,
        include: [{ model: models.Genres }],
      }],
    })

    authorById.novels.forEach(novel => novel.genres.sort((lhs, rhs) => {
      if (lhs.name < rhs.name) {
        return -1
      }
      else if (lhs.name > rhs.name) {
        return 1
      }
      else {
        return 0
      }
    }))



    return authorById
      ? response.send(authorById)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Unable to retrieve author, please try again')
  }
}



module.exports = { getAllAuthors, getAuthorByIdWithNovelAndGenre }




