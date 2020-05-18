/* eslint-disable no-console */
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


const getAuthorByIdIdentifierNovelAndGenre = async (request, response) => {
  try {
    const { identifier } = request.params

    const authorByIdentifier = await models.Authors.findOne({
      attributes: ['id', 'firstName', 'lastName', 'createdAt', 'updatedAt'],
      where: {
        [models.Op.or]: [
          { Id: { [models.Op.like]: `%${identifier}%` } },
          { lastName: { [models.Op.like]: `%${identifier}%` } }
        ]
      },

      include: [{
        model: models.Novels,
        attributes: ['id', 'title', 'authorId', 'createdAt', 'updatedAt'],
        include: [{
          model: models.Genres,
          attributes: ['id', 'name', 'createdAt', 'updatedAt'],
          order: [['name', 'DESC']],
        }],
      }],
    })

    return authorByIdentifier
      ? response.send(authorByIdentifier)
      : response.sendStatus(404)
  } catch (error) {
    console.log('error:', error)

    return response.status(500).send('Unable to retrieve author, please try again')
  }
}

module.exports = { getAllAuthors, getAuthorByIdIdentifierNovelAndGenre }




